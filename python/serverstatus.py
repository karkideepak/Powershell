# We import subprocess so we can run system commands like "ping"
# from inside Python.
import subprocess

# This function checks whether a given server is online or not
def is_server_online(server):
    try:
        # subprocess.run() allows us to execute a system command.
        # Here we call the "ping" command:
        # - "ping" → checks connectivity
        # - "-n 1" → send only 1 ping packet (Windows)
        # NOTE: On Linux/macOS use "-c 1" instead of "-n 1"
        result = subprocess.run(
            ["ping", "-n", "1", server],

            # We suppress (hide) all output from the ping command
            # because we only care if it succeeds or fails
            stdout=subprocess.DEVNULL,
            stderr=subprocess.DEVNULL
        )

        # result.returncode tells whether the command succeeded:
        # 0 = success (server is reachable)
        # anything else = failure (server is not reachable)
        return result.returncode == 0

    except Exception:
        # If something unexpected happens (bad hostname, etc.),
        # we simply treat the server as offline
        return False


# This function reads servers from a file and checks each one
def find_offline_servers(file_path):
    
    # We create an empty list to store servers that are offline
    offline_servers = []

    # Open the file containing server names
    # "r" means read mode
    with open(file_path, "r") as f:
        
        # We read all lines from the file
        # strip() removes spaces/newlines
        # We also ignore empty lines
        servers = [line.strip() for line in f if line.strip()]

    # Loop through each server in the list
    for server in servers:
        
        # Call our function to check if the server is online
        if not is_server_online(server):
            
            # If the server is offline, add it to the list
            offline_servers.append(server)

    # Return the list of offline servers
    return offline_servers


# This block ensures the code runs only when the script is executed directly
# (not when imported into another Python file)
if __name__ == "__main__":

    # Path to your text file containing server names
    file_path = "servers.txt"

    # Call the function and store the result
    offline = find_offline_servers(file_path)

    # Print a header to the screen
    print("Offline Servers:")

    # Loop through each offline server and print it
    for server in offline:
        print(server)
