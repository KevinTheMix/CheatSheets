import platform    # For getting the operating system name
import subprocess  # For executing a shell command

def ping(host):
    """
    Returns True if host (str) responds to a ping request.
    Remember that a host may not respond to a ping (ICMP) request even if the host name is valid.
    """
    param = '-n' if platform.system().lower()=='windows' else '-c'  # Option for the number of packets as a function of
    command = ['ping', param, '1', host]    # Builds the command (e.g.: "ping -c 1 google.com")
    return subprocess.call(command) == 0    # Executes the command.

ping('www.google.com')  # Calls the method