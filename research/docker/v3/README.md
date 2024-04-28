# `SWE-bench` working environment via Docker

1. Install Docker if you don't have it: https://docs.docker.com/engine/install/
2. *Optional*: Install nvidia container toolkit for docker to be able to pass the GPU to the container:
    - Installation: https://docs.nvidia.com/datacenter/cloud-native/container-toolkit/latest/install-guide.html#installing-with-apt
    - Config: https://docs.nvidia.com/datacenter/cloud-native/container-toolkit/latest/install-guide.html#configuration
    - Use: https://docs.nvidia.com/datacenter/cloud-native/container-toolkit/latest/cdi-support.html#using-cdi-with-non-cdi-enabled-runtimes
3. Download my docker image:
    - `docker pull drshushen/swe-bench:v3`
4. Run the container:
    - `docker run -it -p 2222:22 --name swecont --rm drshushen/swe-bench:v3`
    - If you had docker installed with nvidia container toolkit, you can pass the GPU to the container with the extra flag `--gpus all`.
    - If you want to mount a directory to the container, you can use the `-v` flag. For example, to mount the current directory to the container, you can use `docker run -it --rm -v $(pwd):/mnt drshushen/swe-bench:v3`. You will then find it in the container at `/mnt`. It will be synchronized with the host directory.
    - To run in daemon mode, change the `-it` flag to `-d`.
5. You are now in the container. You can run the SWE-bench code under the `conda` `base` environment, e.g. as described
    [here](https://github.com/DrShushen/SWE-bench/blob/main/tutorials/evaluation.md)
    or [here](https://github.com/princeton-nlp/SWE-bench/tree/main/swebench/harness).
6. To log in with SSH:
    - Run `docker inspect --format='{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' swecont` to get the container's IP address.
    - Log in with `ssh user@<container_ip>`, dummy password is `mypass`. 
    - You can use this container with VSCode remote now.

To set uo your Git inside the container:
- Connect to container via SSH as explained above.
- Set up git username and email:
    ```bash
    git config --global user.name "FIRST_NAME LAST_NAME"
    git config --global user.email "MY_NAME@example.com"
    ```
- If you use SSH keys for authenticating GitHub, copy your keys from host machine into the container, along the lines of:
    ```bash
    scp ~/.ssh/id_rsa* user@<container_ip>:/home/user/.ssh/
    ```

**NOTE**

To install SWE-bench:
- share it with the container using `-v` as explained above,
- `conda activate swe-bench` in the container
- `pip install -e .` in the SWE-Bench repo root.

---
### Other notes:
- On SWE-bench Lite: https://www.swebench.com/lite.html
    - Dataset is here: https://huggingface.co/datasets/princeton-nlp/SWE-bench_Lite
