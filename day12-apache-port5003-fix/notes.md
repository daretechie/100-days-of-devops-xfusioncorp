# Day 12: Fix Apache Port 5003 Connectivity Issue

## 1. Problem Description

The Apache web server on `stapp01` is unreachable on port **5003** from the jump host. The goal is to diagnose and resolve the issue, ensuring the service is running, configured correctly, and accessible.

## 2. Troubleshooting Steps

A systematic approach was taken to identify the root cause.

### Step 1: Verify Apache Service Status

First, check if the `httpd` service is running.

```bash
sudo systemctl status httpd
```

If the service is stopped, it should be started. If it's running, proceed to the next step.

### Step 2: Check Listening Ports

Verify that Apache is listening on the expected port (`5003`).

```bash
sudo netstat -tulnp | grep httpd
```

The output should confirm that the `httpd` process is bound to `*:5003` or `0.0.0.0:5003`. If not, the Apache configuration (`/etc/httpd/conf/httpd.conf`) needs to be corrected to listen on that port.

### Step 3: Test Local Connectivity

Attempt to access the service from the server itself to rule out application-level issues.

```bash
curl http://localhost:5003
```

If this succeeds, Apache is working correctly locally.

### Step 4: Diagnose Remote Connectivity

When testing from the jump host, the following error was observed:

```bash
curl http://stapp01:5003
# curl: (7) Failed to connect to stapp01 port 5003: No route to host
```

This error, especially "No route to host," strongly suggests a firewall is blocking the connection.

### Step 5: Inspect Firewall Rules

Examine the `iptables` rules to see if traffic on port 5003 is being blocked.

```bash
sudo iptables -L -n -v
```

The rules revealed a `REJECT` rule that was preventing incoming connections.

## 3. Solution

The issue was a missing firewall rule to allow traffic on port `5003`. The solution involves adding a rule to the `INPUT` chain and ensuring the change is permanent.

### Step 1: Allow Traffic on Port 5003

Insert a rule at the top of the `INPUT` chain to accept TCP traffic on port `5003`.

```bash
sudo iptables -I INPUT -p tcp --dport 5003 -j ACCEPT
```

### Step 2: Persist Firewall Rules

The new rule is temporary and will be lost on reboot. Save it to make it persistent.

```bash
sudo iptables-save | sudo tee /etc/sysconfig/iptables
```

This command saves the current `iptables` configuration to a file that is loaded at boot time.

## 4. Key Commands

```bash
# Check service status
sudo systemctl status httpd

# Check listening ports
sudo netstat -tulnp | grep httpd

# Add firewall rule
sudo iptables -I INPUT -p tcp --dport 5003 -j ACCEPT

# Save firewall rules
sudo iptables-save | sudo tee /etc/sysconfig/iptables

# Test connectivity
curl http://stapp01:5003
```

## 5. Lessons Learned

*   **"No route to host" often means a firewall:** This error is a strong indicator that a firewall on the server is rejecting the connection.
*   **Verify layer by layer:** Troubleshoot systematically—from the application service (`httpd`) to the network port (`netstat`) and finally the network firewall (`iptables`).
*   **Firewall rules are temporary by default:** Changes made to `iptables` are lost on reboot unless explicitly saved.