#!/usr/bin/env python3
import os
import sys

import setuptools.command.egg_info as egg_info_cmd
from setuptools import setup

SETUP_DIR = os.path.dirname(__file__)
README = os.path.join(SETUP_DIR, "README.md")

try:
    import gittaggers

    tagger = gittaggers.EggInfoFromGit
except ImportError:
    tagger = egg_info_cmd.egg_info

setup_requires = []
install_requires = [
    "pyshex",
    "arvados-python-client",
    "python-magic",
    "py-dateutil",
    "schema-salad",
    "rdflib>=4.2.2,<4.3.0",
    "pyyaml",
    "biopython",
    "click"
]

needs_pytest = {"pytest", "test", "ptr"}.intersection(sys.argv)
pytest_runner = ["pytest < 6", "pytest-runner < 5"] if needs_pytest else []

setup(
    name="hguploader",
    version="1.0",
    description="CBRC/BORG sequence uploader",
    long_description=open(README).read(),
    long_description_content_type="text/markdown",
    author="Maxat Kulmanov",
    author_email="maxat.kulmanov@kaust.edu.sa",
    license="Apache 2.0",
    packages=["hguploader",],
    package_data={"hguploader": ["schema.yml",
                                      "options.yml",
                                      "shex.rdf",
                                      "validation/formats",],
    },
    install_requires=install_requires,
    extras_require={},
    setup_requires=setup_requires + pytest_runner,
    tests_require=["pytest<5"],
    entry_points={
        "console_scripts": [
            "hguploader=hguploader.main:main",
        ]
    },
    zip_safe=True,
    cmdclass={"egg_info": tagger},
    python_requires=">=3.5, <4",
)
