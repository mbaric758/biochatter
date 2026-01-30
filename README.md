# BioChatter

|     |     |     |     |
| --- | --- | --- | --- |
| __License__ | [![License: Apache 2.0](https://img.shields.io/badge/license-Apache%202-blue)](https://opensource.org/license/apache-2-0) | __Python__ | [![Python](https://img.shields.io/pypi/pyversions/biochatter)](https://www.python.org) |
| __Package__ | [![PyPI version](https://img.shields.io/pypi/v/biochatter)](https://pypi.org/project/biochatter/) [![Downloads](https://static.pepy.tech/badge/biochatter)](https://pepy.tech/project/biochatter) [![DOI](https://zenodo.org/badge/650181006.svg)](https://zenodo.org/doi/10.5281/zenodo.10777945) | __Build status__ | [![CI](https://github.com/biocypher/biochatter/actions/workflows/ci.yaml/badge.svg)](https://github.com/biocypher/biochatter/actions/workflows/ci.yaml) [![Docs](https://github.com/biocypher/biochatter/actions/workflows/docs.yaml/badge.svg)](https://github.com/biocypher/biochatter/actions/workflows/docs.yaml) |
| __Tests__ | [![Coverage](https://raw.githubusercontent.com/biocypher/biochatter/coverage/coverage.svg)](https://github.com/biocypher/biochatter/actions/workflows/ci.yaml) | __Docker__ | [![Latest image](https://img.shields.io/docker/v/biocypher/chatgse)](https://hub.docker.com/repository/docker/biocypher/chatgse/general) [![Image size](https://img.shields.io/docker/image-size/biocypher/chatgse/latest)](https://hub.docker.com/repository/docker/biocypher/chatgse/general) |
| __Development__ | [![Project Status: Active – The project has reached a stable, usable state and is being actively developed.](https://www.repostatus.org/badges/latest/active.svg)](https://www.repostatus.org/#active) [![Code style](https://img.shields.io/badge/code%20style-black-000000.svg)](https://black.readthedocs.io/en/stable/) [![Ruff](https://img.shields.io/endpoint?url=https://raw.githubusercontent.com/astral-sh/ruff/main/assets/badge/v2.json)](https://github.com/astral-sh/ruff) | __Contributions__ | [![PRs Welcome](https://img.shields.io/badge/PRs-welcome-brightgreen.svg?style=flat-square)](http://makeapullrequest.com) [![Contributor Covenant](https://img.shields.io/badge/Contributor%20Covenant-2.1-4baaaa.svg)](CONTRIBUTING.md) |

## Description

🤖 BioChatter is a community-driven Python library that connects biomedical
applications to conversational AI, making it easy to leverage generative AI
models in the biomedical domain.

### 🌟 Key Features
- Generic backend for biomedical AI applications
- Seamless integration with multiple LLM providers
- Native connection to BioCypher knowledge graphs
- Extensive testing and evaluation framework
- Living benchmark of specific biomedical applications

### 🚀 Demo Applications and Utilities

- [BioChatter Light](https://light.biochatter.org) - Simple Python frontend
([repo](https://github.com/biocypher/biochatter-light))

- [BioChatter Next](https://next.biochatter.org) - Advanced Next.js frontend
([repo](https://github.com/biocypher/biochatter-next))

- [BioChatter Server](https://github.com/biocypher/biochatter-server) - RESTful
API server

📖 Learn more in our [paper](https://www.nature.com/articles/s41587-024-02534-3)
(self-archived [here](https://zenodo.org/records/15684945)).

## Installation

To use the package, install it from PyPI, for instance using pip (`pip install
biochatter`) or Poetry (`poetry add biochatter`).

### Extras

The package has some optional dependencies that can be installed using the
following extras (e.g. `pip install biochatter[xinference]`):

- `xinference`: support for querying open-source LLMs through Xorbits Inference

- `podcast`: support for podcast text-to-speech (for the free Google TTS; the
paid OpenAI TTS can be used without this extra)

- `streamlit`: support for streamlit UI functions (used in BioChatter Light)

## Usage

Check out the [documentation](https://biochatter.org/) for examples, use cases,
and more information. Many common functionalities covered by BioChatter can be
seen in use in the [BioChatter
Light](https://github.com/biocypher/biochatter-light) code base.  [![Built with
Material for
MkDocs](https://img.shields.io/badge/Material_for_MkDocs-526CFE?style=for-the-badge&logo=MaterialForMkDocs&logoColor=white)](https://squidfunk.github.io/mkdocs-material/)

## 🤝 Getting involved

We are very happy about contributions from the community, large and small!
If you would like to contribute to BioCypher development, please refer to
our [contribution guidelines](CONTRIBUTING.md) and the [developer
docs](DEVELOPER.md). :)

If you want to ask informal questions, talk about dev things, or just chat,
please join our community at https://biocypher.zulipchat.com!

> **Imposter syndrome disclaimer:** We want your help. No, really. There may be a little voice inside your head that is telling you that you're not ready, that you aren't skilled enough to contribute. We assure you that the little voice in your head is wrong. Most importantly, there are many valuable ways to contribute besides writing code.
>
> This disclaimer was adapted from the [Pooch](https://github.com/fatiando/pooch) project.

## Git LFS Configuration

This repository uses Git LFS for some large files. If you're a developer and don't need to work with these files, you have two options:

1. Disable Git LFS smudge globally (set once for all repositories):
```bash
git lfs install --skip-smudge
git clone https://github.com/biocypher/biochatter.git
```

2. Skip LFS files for a one-time clone:
```bash
GIT_LFS_SKIP_SMUDGE=1 git clone https://github.com/biocypher/biochatter.git
```

Both options will prevent Git LFS from downloading the large files while still allowing you to work with the repository normally.

## Citation

If you use BioChatter in your work, please cite our
[paper](https://www.nature.com/articles/s41587-024-02534-3).

## Running the Pasteur benchmark

### Setting up API access

In order to run the benchmark with the Pasteur models you first need to change the `base_url` field of the `GptConversation`
initialization settings in `benchmark/conftest.py` to the URL of the Pasteur cloud from which the LLMs should be accessed.

This information can also be found in the `API Reference` section of the Pasteur models homepage. 

After changing the `base_url` filed of the conversation initialization settings, you can use any of the models available
through AI Pasteur, as they are all configured to use the OpenAI API standard.

### Running the benchmark on the cluster

The scripts for running the benchmark on the cluster can be found in the `benchmark/cluster/` directory. There you can find 
the `run_benchmark.sh` script which can be used to submit the benchmark jobs to the cluster. This is the highest level 
script and it will call the other scripts in the directory when needed. Notably it will call the `setup_venv.sh` script,
which is in charge of installing a virtual environment with all the required dependencies for running the benchmark. These
dependencies are listed in the `requirements.txt` file in the same directory, and were extracted from the `pyproject.toml` file.

Before submitting the benchmark jobs to the cluster, you may define the LLMs that you wish to be evaluated in the `models` section
of the `run_benchmark.sh` script. You may also define the complexities of the benchmark questions to be used in the `complexities` section.
You may also set up the partition of the cluster that you wish to use in the `#SBATCH --partition=YOUR_PARTITION_NAME` line.

To run the benchmark, you need to copy the `biochatter` fork into the cluster (or at least the `benchmark` directory),
and execute the `run_benchmark.sh` script from the `ROOT`. This will submit the benchmark jobs to the cluster, one job per
model-complexity pair. The results of the benchmark will be saved in the `benchmark/results/` directory. 

The script is by default configured to run the default tests from `test_biocypher_query_generation.py` using the `benchmark-cli` 
call. If you wish to run custom tests, you may modify the `TEST_FILE` variable in the `run_benchmark.sh` script to point to your custom test file.
In case of the `OncodashkB` mock benchmark tests, you may use the `test_decider_query_generation.py` test file.

### Visualizing the results

To visualize the results,  copy the results directory back into your local machine and run `poetry run python docs/scripts/hooks.py` 
from the `ROOT` of the repository. This will generate the plots and save them in the `docs/images/` directory. More information on the processing can be found
in the developer notes of the docs at https://biochatter.org/latest/benchmark/developer/.

Error and standard output logs for each benchmark job will be saved in respective `.err` amd `.out` files in the
directory from which the `run_benchmark.sh` script was executed. These logs will contain the output of the benchmark runs from
pytest, along with the output queries generated by the models for each test case.

### Creating custom test cases with OncodashKB

You can create custom test cases for the Pasteur benchmark using the OncodashKB knowledge graph. A "version in progress" of the
schema graph is available in the `benchmark/data/benchmark_kg_schema_data.yaml` file under `decider_kg`, along with two
mock test cases in the `benchmark/data/benchmark_query_test_data.yaml` file under `decider_query_generation`. These test
cases are only for demonstration purposes and should not be used in the actual benchmark.

### CLI

Tests can also be run through the CLI using the `benchmark-cli` command. The available options are:
```bash

        sbatch  benchmark-cli \
                --models \
                --case \
                --nb_iterations \
                --test

```