#!/bin/bash

while getopts e:i: flag
do
    case "${flag}" in
        e) ENVIRONMENT=${OPTARG};;
        i) INSTANCE=${OPTARG};;
    esac
done

function show_usage() 
{
	echo ""
	echo "Usage: <cmd> -e <environment> -i <instance>"
	echo "  -e <environment> - environment for which scripts is going to be executed - see: environments/ dir, eg: local"
	echo "  -i <instance> - instance for which scripts is going to be executed - see: environments/<environment>/ dir, eg: php"
	echo ""
	echo "Example:"
	echo "<cmd> -e local -i php"
}

function validate_arguments() 
{
	if [ -z "${ENVIRONMENT}" ] ; then
		echo "Environment parameter not provided!"
		show_usage
        exit 1
	fi

	if [ -z "${INSTANCE}" ] ; then
		echo "Instance parameter not provided!"
		show_usage
		exit 1
	fi
}

validate_arguments

home_dir=$(dirname "$0")
common_vars_path=${home_dir}/constants/common.yml
custom_vars_path=${home_dir}/environments/${ENVIRONMENT}/${INSTANCE}/main.yml

ansible-playbook -K -e @${common_vars_path} -e @${custom_vars_path} -i inventory/static_inventory.yml php.yml