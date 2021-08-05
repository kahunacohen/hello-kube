#!/usr/bin/env bash

kubectl exec web-deployment-584645cfc-wvqtf -- curl -s "http://vault:8200/v1/sys/health?standbyok=true"
kubectl exec web-deployment-584645cfc-wvqtf -- curl --request POST  --data '{"jwt": \""$(cat $JWT_PATH)"\", "role": "webapp"}'  http://vault:8200/v1/auth/kubernetes/login

eyJhbGciOiJSUzI1NiIsImtpZCI6Imh5U3p4dGxZdG9pNTdrSHhRWXZGMzlIUU52NzJOS2VIdDQ1ZXhIcS1mUEUifQ.eyJhdWQiOlsiaHR0cHM6Ly9rdWJlcm5ldGVzLmRlZmF1bHQuc3ZjLmNsdXN0ZXIubG9jYWwiXSwiZXhwIjoxNjU5NTEyNDUxLCJpYXQiOjE2Mjc5NzY0NTEsImlzcyI6Imh0dHBzOi8va3ViZXJuZXRlcy5kZWZhdWx0LnN2Yy5jbHVzdGVyLmxvY2FsIiwia3ViZXJuZXRlcy5pbyI6eyJuYW1lc3BhY2UiOiJkZWZhdWx0IiwicG9kIjp7Im5hbWUiOiJ3ZWItZGVwbG95bWVudC01ODQ2NDVjZmMtd3ZxdGYiLCJ1aWQiOiJjY2RiYzhmNS1lYzVhLTQ1MGItOWJkYi0zZGNiZDkzNmUzZmIifSwic2VydmljZWFjY291bnQiOnsibmFtZSI6ImRlZmF1bHQiLCJ1aWQiOiJlOGI5ZDhlMi1lNmRlLTQyMjQtYTA0MS1hMDUxZmMyYmJlNDAifSwid2FybmFmdGVyIjoxNjI3OTgwMDU4fSwibmJmIjoxNjI3OTc2NDUxLCJzdWIiOiJzeXN0ZW06c2VydmljZWFjY291bnQ6ZGVmYXVsdDpkZWZhdWx0In0.WQhNu1rPIFUMmRSgD_DyAPO8bxA1LYd7tppWvpkqXxafWTeBipPl2K1tFGfcdbrkQlyAyW-OIbfB5WwLnuunm0RZXjwSe4z5rYOdE-c80mZI_q4L-ufOTsOt83cJ6t42gJ_UF9I9PNc9_PJjfv6keCf7WdwL1JONJXtLYvhIg9zfiQ5t1WS3Xd13-H4N4tZZAZ9oEiZjbKT9EaMAMhb6kkhL6bOe5JQHYwTyXSuJ91ENVpco52Mq-H8jG78WdGCwwuG53WZSo9ewgADbr_o61lwIFkFroqupIvCteqXM3o2Qd6GtyEzPjLB45cmRL9c0gfKf_ckU3FC4FEHNgflEFA
echo "JWT=\$(cat \$JWT_PATH);\necho \$JWT_PATH;\necho \"\$JWT\";\ncurl -s http://vault:8200/v1/sys/health?standbyok=true\ncurl --header \"Content-Type: application/json\" -v --trace-ascii /dev/stdout --request POST --data \"{\\\"jwt\\\": \\\"\$JWT\\\", \\\"role\\\": \\\"webapp\\\"}\" http://vault:8200/v1/auth/kubernetes/login" > t.sh


curl --request POST --data '{"jwt": "eyJhbGciOiJSUzI1NiIsImtpZCI6Imh5U3p4dGxZdG9pNTdrSHhRWXZGMzlIUU52NzJOS2VIdDQ1ZXhIcS1mUEUifQ.eyJhdWQiOlsiaHR0cHM6Ly9rdWJlcm5ldGVzLmRlZmF1bHQuc3ZjLmNsdXN0ZXIubG9jYWwiXSwiZXhwIjoxNjU5NjQ0Mjk0LCJpYXQiOjE2MjgxMDgyOTQsImlzcyI6Imh0dHBzOi8va3ViZXJuZXRlcy5kZWZhdWx0LnN2Yy5jbHVzdGVyLmxvY2FsIiwia3ViZXJuZXRlcy5pbyI6eyJuYW1lc3BhY2UiOiJkZWZhdWx0IiwicG9kIjp7Im5hbWUiOiJ3ZWItZGVwbG95bWVudC1jODc0ZjZkNzYtbHpqbXciLCJ1aWQiOiI1M2QyMDU2Ny04ZDg4LTQxNTktODFiYy02ZGUxYjI4ZTViNGMifSwic2VydmljZWFjY291bnQiOnsibmFtZSI6ImRlZmF1bHQiLCJ1aWQiOiJlOGI5ZDhlMi1lNmRlLTQyMjQtYTA0MS1hMDUxZmMyYmJlNDAifSwid2FybmFmdGVyIjoxNjI4MTExOTAxfSwibmJmIjoxNjI4MTA4Mjk0LCJzdWIiOiJzeXN0ZW06c2VydmljZWFjY291bnQ6ZGVmYXVsdDpkZWZhdWx0In0.LOBBMi2xB0Xr8giHn5yk81JVMDd-vOlMAVIFz7mnNiYiYrYreBEx7Wz8viMooFDD5ArcZpAGgg2Jk18ltDb2IyfUAHY9Qq0H42menP1Nu9mj6XwC5zFGLmoMpbhbBmnB0-50rkQXzpoz6Kd0DiTMHAR1nhU6g8vfibeUq26LIrl5U3ZoJZlXchv9U6B3n-8G7gKbGn9NAktSzTCsczTUrDyL-eqk4HNXYh0rMI9nPuf8orF2Wu89WLop72O42cNgzPgE2omx7RqQ2StrozJ6ve5WNviUVe-PqDtR5krc7phXM_dxLU3uNbQOMvyfPkRgw32E3DiTZHYIkHuR18aDsQ", "role": "webapp"}' http://vault:8200/v1/auth/kubernetes/logi 