# Consumer Data Right Standards

This repository contains the binding API Standards and Information Security profile created in response to the [Consumer Data Right](https://treasury.gov.au/consumer-data-right "Treasury's Consumer Data Right webpage") legislation and the subsequent regulatory rules. The purpose of the Consumer Data Right is to give Australians greater control over their data and is intended to apply sector by sector across the whole Australian economy.

These standards are maintained by the Data Standards Body (DSB), with the Data Standards Chair as the decision maker. The [Data Standards Body](https://www.directory.gov.au/portfolios/treasury/department-treasury/central-office/markets-group/market-conduct-and-digital-division/data-standards-body) is part of the Treasury. The work of standards development is conducted in consultation with the [Australian Competition and Consumer Commission (ACCC)](https://www.accc.gov.au/focus-areas/consumer-data-right-cdr-0 "ACCC's CDR webpage") as co-regulator of the Consumer Data Right, along with the [Office of the Australian Information Commissioner (OAIC)](https://www.oaic.gov.au/consumer-data-right "OAIC CDR webpage").


## Test Build and Run

> **⚠️ Test environment only — do not use in production.**
>
> This Docker build uses legacy software versions, including **Ubuntu 20.04 and Ruby 2.6.3**, and dependencies required to build the documentation. It is provided for **testing and development purposes only** and is **not suitable for production use**.

```bash
# Build the Docker image
docker build -t slate-docs .

# Run the Docker container
docker run --rm -p 80:80 slate-docs
```

Open a browser and navigate to:

`http://localhost`

### Extract Generated Documentation

The documentation is generated inside the Docker image. To copy the generated files back to the local machine, create a temporary container from the image and copy the files out:

```bash
docker create --name slate-docs-extract slate-docs
docker cp slate-docs-extract:/opt/standards/docs-dev/. <destination-dir>
```

## Additional information

- [Data Standards Body website](https://dsb.gov.au/) - Contains additional information on the CDR and the DSB as well as notifications of the latest developments.
- [Data Standards](https://consumerdatastandardsaustralia.github.io/standards/) - The published contents of the standards in this repository. This is the formal documentation of the binding standards.

## Contributing to the Standards 

Consultation on the standards as they evolve is performed transparently with any interested contributor invited to participate in accordance with the rules of engagement described below. 

There are a number of ways to contribute to these standards: 

- [Treasury Consult](https://consult.treasury.gov.au/) – The formal process for public consultation on proposed changes to the data standards is conducted on the Treasury Consultation Platform. The DSB will provide information regarding open consultations via the usual communication channels.  

- **[Issues posted on this repository](https://github.com/ConsumerDataStandardsAustralia/standards/issues)** - The issues posted on this repository are specific decision proposals that are being considered by the Data Standards Chair. These decisions constitute significant changes to the standards and are raised as required by the Data Standards Body, following their assessment. These issues constitute an audit trail of the decisions taken by the Data Standards Chair. As this is the case it is requested that contributors do not raise new issues. 

- **[The standards maintenance repository](https://github.com/ConsumerDataStandardsAustralia/standards-maintenance)** – The issues posted on this repository inform the evidence and backlog of issues that is under ongoing assessment by the Data Standards Body. Contributors are encouraged to raise new issues in this repository that will then be assessed by the Data Standards Body. The Consumer Data Right Support Portal is the preferred way to search for answers, raise questions and request clarification of the standards. 

- **[Via email](mailto:contact@dsb.gov.au)** - If you would like to submit a confidential question or item of feedback, or if GitHub feels unfamiliar, the DSB welcome email correspondence related to the standards and the standards development process. 

## Rules of engagement for this repository

We ask that all contributors to the Consumer Data Standards repositories comply with the [GitHub Community Forum Code of Conduct](https://help.github.com/articles/github-community-forum-code-of-conduct/).

In addition, it would be appreciated if the following rules are adhered to when commenting or contributing:

- Please provide a single, considered response to each proposal covering all feedback concerning the proposal.
- For transparency, if you work at or are associated with an organisation with an interest in the standards, please indicate this in your response.
- Please ensure you are aware of and compliant with any social media guidelines or internal processes for response set by your organisation before providing feedback.
- Please refrain from initiating new issues or pull requests in this repository due to the need for formal approval of all aspects of the standards.
