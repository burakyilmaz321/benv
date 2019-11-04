"""Setup configuration"""

from setuptools import find_packages, setup

with open("README.md", "r") as fh:
    LONG_DESCRIPTION = fh.read()

setup(
    url='https://github.com/burakyilmaz321/benv',
    license='MIT',
    name="benv-burakyilmaz321",
    version="0.1.1",
    author="Burak Yilmaz",
    author_email="burakyilmaz321@gmail.com",
    description='A minimalistic Python virtual environment manager'
                'that no one needs',
    long_description=LONG_DESCRIPTION,
    install_requires=['click'],
    long_description_content_type="text/markdown",
    packages=find_packages(),
    classifiers=[
        "Programming Language :: Python :: 3",
        "License :: OSI Approved :: MIT License",
        "Operating System :: OS Independent",
        "Development Status :: 1 - Planning",
    ],
    python_requires='>=3.3',
    entry_points='''
        [console_scripts]
        benv=benv.benv:cli
    ''',
)
