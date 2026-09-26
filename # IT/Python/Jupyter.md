# [Jupyter](https://jupyter.org)

## Quick Tips

* Every notebook is associated with a specific kernel, which runs a cell input
* Sequential execution stops at first error encountered (following cells can still be executed manually)
* Reopening a notebook displays previously saved outputs even if the kernel has been shut down, but live variables and memory state are not preserved

## Glossary

* **Anaconda** = Python/R distribution + package/environment manager (conda) that includes Jupyter Notebook, JupyterLab, and many scientific packages
* **Cell** = basic notebook unit containing code, Markdown, or raw text; executed independently
* **Google Colab** = Google's hosted version of a Jupyter Notebook environment, which runs in the cloud and requires no local installation
* **Kernel** = execution context/engine/namespace/session/VM that maintains notebook state (variables, imports, memory). Execution order matters more than cell position
* **JupyterHub** = multi-user server for Jupyter Notebooks
* **JupyterLab** = next-generation Jupyter web interface (introduced in 2018), providing notebooks, terminals, file browser, editors, and extensions in a single workspace
* **Notebook** (_.ipynb_) = interactive web-based document and execution environment combining code, Markdown, LaTeX math, plots, and rich output
  * Internally stored as a structured JSON file containing cells, metadata, execution counts, and saved outputs/results

## Environment

### Associated Python Libraries

* **ipykernel** = IPython kernel implementation used by Jupyter to execude Python code
  * `python -m ipykernel install --sysprefix --name python3 --display-name "Python 3 (Notebook Demo)"` = includes kernel inside virtual env
* **jupyter-client** = communicates with Jupyter kernels (starts kernels, sends code for execution, receives results)
* **nbclient** = executes Jupyter notebooks programmatically
* **nbformat** = reads/writes/validates _.ipynb_ notebook files

### Menus

* Kernel
  * Interrupt = pause kernel currently running (long) treatment
  * _Restart & Clear output_ = clears original cell order
  * _Change Kernel_

### Shortcuts

`Shift + Enter` = execute a single
