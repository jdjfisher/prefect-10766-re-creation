from prefect import flow, task
import time

@task(log_prints=True, timeout_seconds=3)
def say_hello():
    message = "Hello world!"

    for letter in message:
        print(letter)
        time.sleep(1)

@flow(log_prints=True)
def hello_world():
    say_hello()
    print("TIMEOUT NOT ENFORCED")
