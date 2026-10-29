# Standards Staging

This repository is used to stage (draft) changes for the Data Standards. Staged changes are available for review by the CDR community before being promoted and published as Data Standards.

Please refer to the [Standards repository](https://github.com/ConsumerDataStandardsAustralia/standards) for more information.

## Change promotion strategy

Changes will be made to this repository via standards consultation branches, where <id> is the identifier of the standards consultation as published in the [issue tracker](https://github.com/ConsumerDataStandardsAustralia/standards/issues) in the standards repository (e.g. cd/374).

Once a release is scheduled, the changes authored via the standards consultation/staging branches will be merged into a release branch which, once reviewed for correctness, will be pushed to the main standards repository. Release branches will also include direct changes such as modification of release notes, version numbers and links to archives of previous versions. Release branches will take the following form.

* **Release candidate branches:** `release/<version>`<br>
The name of the each release branch where `<version>` is the semver version of the candidate release (e.g. `release/1.6.0`).
 
In addition, the following branch types will be used for specific purposes:

* **Experimental branches:** `poc/<name>`<br>
Used for experiments or proof of concepts and allows for experimentation to be kept separate to the change management process. Experimental branches will never be directly merged and would need to become a change request or decision proposal branch.

* **Operational branches:** `operations/<name>`<br>
Used to contain operational code such as publishing scripts and libraries.

## Rules of engagement for this repository

We ask that all contributors to the Consumer Data Standards repositories comply with the [GitHub Community Forum Code of Conduct](https://help.github.com/articles/github-community-forum-code-of-conduct/).

In addition, it would be appreciated if the following rules are adhered to when commenting or contributing:
* Please provide a single, considered response to each proposal covering all feedback concerning the proposal.
* For transparency, if you work at or are associated with an organisation with an interest in the standards, please indicate this in your response.
* Please ensure you are aware of and compliant with any social media guidelines or internal processes for response set by your organisation before providing feedback.
* Please refrain from initiating new issues or pull requests in this repository due to the need for formal approval of all aspects of the standards
