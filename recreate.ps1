./Scripts/activate

pip install -r requirements.txt

$server = Start-Process -FilePath "prefect" -ArgumentList "server", "start" -PassThru

prefect work-pool create --type process my-work-pool --overwrite

prefect --no-prompt deploy flow.py:hello_world --name my-deployment --pool my-work-pool

prefect deployment run 'hello-world/my-deployment'

prefect worker start --pool my-work-pool

if ($server -and !$server.HasExited) {
    Stop-Process -Id $server.Id -Force
}