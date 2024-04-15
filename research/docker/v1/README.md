# `SWE-bench` working environment via Docker

1. Install Docker if you don't have it: https://docs.docker.com/engine/install/
2. *Optional*: Install nvidia container toolkit for docker to be able to pass the GPU to the container:
    - Installation: https://docs.nvidia.com/datacenter/cloud-native/container-toolkit/latest/install-guide.html#installing-with-apt
    - Config: https://docs.nvidia.com/datacenter/cloud-native/container-toolkit/latest/install-guide.html#configuration
    - Use: https://docs.nvidia.com/datacenter/cloud-native/container-toolkit/latest/cdi-support.html#using-cdi-with-non-cdi-enabled-runtimes
3. Download my docker image:
    - `docker pull drshushen/swe-bench:v1`
4. Run the container:
    - `docker run -it --rm drshushen/swe-bench:v1`
    - If you had docker installed with nvidia container toolkit, you can pass the GPU to the container with the extra flag `--gpus all`.
    - If you want to mount a directory to the container, you can use the `-v` flag. For example, to mount the current directory to the container, you can use `docker run -it --rm -v $(pwd):/mnt drshushen/swe-bench:v1`. You will then find it in the container at `/mnt`. It will be synchronized with the host directory.
5. You are now in the container. You can run the SWE-bench code under the `conda` `base` environment, e.g. as described
    [here](https://github.com/DrShushen/SWE-bench/blob/main/tutorials/evaluation.md)
    or [here](https://github.com/princeton-nlp/SWE-bench/tree/main/swebench/harness).



---
### Other notes:
- On SWE-bench Lite: https://www.swebench.com/lite.html
    - Dataset is here: https://huggingface.co/datasets/princeton-nlp/SWE-bench_Lite
