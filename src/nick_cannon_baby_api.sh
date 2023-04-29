#!/bin/bash

api="https://nick-cannon-baby-api.onrender.com"
user_agent="Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/103.0.5060.114 Safari/537.36"

function get_random_baby() {
    # 1 - date: (string): <MM/DD/YYYY - optional>
    # 2 - mother: (string): <mother's name - optional>
    # 3 - gender: (string): <male/female - optional>
    # 4 - results: (integer): <number of results - optional>
    url="$api/babies/random"
    if [[ -n $1 ]]; then
       url="$url?date=$1"
    fi
    if [[ -n $2 ]]; then
        url="$url&mother=$2"
    fi
    if [[ -n $3 ]]; then
        url="$url&gender=$3"
    fi
    if [[ -n $4 ]]; then
        url="$url&results=$4"
    fi
    curl --request GET \
        --url "$url" \
        --user-agent "$user_agent" \
        --header "content-type: application/json"
}

function get_all_mothers() {
    curl --request GET \
        --url "$api/babies/mothers" \
        --user-agent "$user_agent" \
        --header "content-type: application/json"
}

function get_all_names() {
    curl --request GET \
        --url "$api/babies/names" \
        --user-agent "$user_agent" \
        --header "content-type: application/json"
}
