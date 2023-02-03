package test

import (
	"fmt"
	"strings"
	"testing"

	"github.com/gruntwork-io/terratest/modules/aws"

	"github.com/gruntwork-io/terratest/modules/terraform"
	"github.com/stretchr/testify/assert"
)

func TestCallTests(t *testing.T) {
	terraformOptions := terraform.WithDefaultRetryableErrors(t, &terraform.Options{
		TerraformDir: "../example/",
	})
	//after the test is done, run terraform destroy
	defer terraform.Destroy(t, terraformOptions)

	//init terraform
	terraform.InitAndApply(t, terraformOptions)

	//test vpc
	testVpc(t, terraformOptions)

	//test private subnet
	testPrivateSubnet(t, terraformOptions)

	//test public subnet
	testPublicSubnet(t, terraformOptions)
}

func testVpc(t *testing.T, terraformOptions *terraform.Options) {
	output := terraform.Output(t, terraformOptions, "vpc_name")
	assert.Equal(t, "eks-vpc-test", output)
}

func testPrivateSubnet(t *testing.T, terraformOptions *terraform.Options) {
	privateSubnetId := terraform.Output(t, terraformOptions, "private_subnets")
	replacer := strings.NewReplacer("[", "", "]", "", "\"", "", "\n", "", " ", ",")
	subnetPrivlID := replacer.Replace(privateSubnetId)
	arrayPublSubnets := strings.Split(subnetPrivlID, ",")

	for _, subnet := range arrayPublSubnets {
		assert.False(t, aws.IsPublicSubnet(t, subnet, "us-east-1"))
	}
}

func testPublicSubnet(t *testing.T, terraformOptions *terraform.Options) {
	publicSubnetId := terraform.Output(t, terraformOptions, "public_subnets")
	replacer := strings.NewReplacer("[", "", "]", "", "\"", "", "\n", "", " ", ",")
	subnetPublID := replacer.Replace(publicSubnetId)
	arrayPublSubnets := strings.Split(subnetPublID, ",")

	for _, subnet := range arrayPublSubnets {
		assert.True(t, aws.IsPublicSubnet(t, subnet, "us-east-1"))
	}
}
