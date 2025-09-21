# Notes – Day 45: Fix Broken Dockerfile

## 🔍 Analysis of the Broken Dockerfile

The provided `Dockerfile` at `/opt/docker/Dockerfile` had several syntax errors that prevented the Docker image from building successfully. The primary issue was the incorrect use of the `ADD` instruction.

### Incorrect `ADD` Usage

The `ADD` instruction is intended for copying files and directories from a source (like the build context) into the Docker image's filesystem. It was being used to execute `sed` commands, which is not its purpose.

**Original (Incorrect) Lines:**
```dockerfile
ADD sed -i "s/Listen 80/Listen 8080/g" /usr/local/apache2/conf/httpd.conf
ADD sed -i '/LoadModule\ ssl_module modules\/mod_ssl.so/s/^#//g' conf/httpd.conf
...
```

### The Fix: Using `RUN`

The correct instruction to execute shell commands within a Docker image build process is `RUN`. By replacing `ADD` with `RUN`, the `sed` commands are executed correctly, modifying the Apache configuration as intended.

## ✅ Corrected Dockerfile

Here is the corrected version of the `Dockerfile`:

```dockerfile
FROM httpd:2.4.43

# Use RUN to execute commands to modify the httpd.conf file
RUN sed -i "s/Listen 80/Listen 8080/g" /usr/local/apache2/conf/httpd.conf && \
    sed -i '/LoadModule ssl_module modules/mod_ssl.so/s/^#//g' /usr/local/apache2/conf/httpd.conf && \
    sed -i '/LoadModule socache_shmcb_module modules/mod_socache_shmcb.so/s/^#//g' /usr/local/apache2/conf/httpd.conf && \
    sed -i '/Include conf/extra/httpd-ssl.conf/s/^#//g' /usr/local/apache2/conf/httpd.conf

# Use COPY to add files from the build context to the image
COPY certs/server.crt /usr/local/apache2/conf/server.crt
COPY certs/server.key /usr/local/apache2/conf/server.key
COPY html/index.html /usr/local/apache2/htdocs/
```
*Note: The multiple `RUN sed` commands were combined into a single `RUN` instruction using `&&` for better layer efficiency.*

## 💡 Key Lessons Learned

- **`RUN` vs. `ADD`/`COPY`**:
    - `RUN`: Executes commands in a new layer on top of the current image. Used for installing packages, running scripts, or modifying files.
    - `ADD`/`COPY`: Copies files from the build context (or a URL for `ADD`) into the image. `COPY` is generally preferred for its transparency.
- **Dockerfile Instructions are Uppercase**: By convention, instructions like `FROM`, `RUN`, and `COPY` are written in uppercase to distinguish them from arguments.
- **Path Consistency**: Ensure that paths used in commands (`RUN`) and copy operations (`COPY`) are correct and consistent. In this case, the full path to `httpd.conf` is `/usr/local/apache2/conf/httpd.conf`.

## 🚀 Commands Used for Verification

```bash
# 1. Navigate to the directory containing the Dockerfile
cd /opt/docker

# 2. Build the Docker image with a tag
sudo docker build -t fixed-httpd-image .

# 3. Run a container to test the image
# This maps the container's internal port 8080 to the host's port 8080
sudo docker run -d -p 8080:8080 fixed-httpd-image
```