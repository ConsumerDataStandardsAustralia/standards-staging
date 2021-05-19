# Standards Staging

This repository is the staging repository for the Consumer Data Standards.  The published standards can be found in the primary repsitory: https://github.com/ConsumerDataStandardsAustralia/standards

This repository is used to stage changes that are pending formal approval by the Data Standards Chair so that the CDR community can verify the changes being authored.  Once a release is approved it will be pushed to the main standards repository.

For more detail on the Consumer Data Standards, including how to contribute feedback, refer to the README in the main standards repository.

## Change promotion strategy

Changes will be made to this repository via three different types of branches.  These are:

* **Change request branches:** `maintenance/<id>`<br/>
Changes related to a change request where <id> is the issue id for the change request in the standards-maintenance repository (e.g. maintenance/301).
  
* **Defect fix branch:** `defect/<id>`<br/>
Changes related to a defect fix where <id> is the issue id for the defect in the standards- staging repository. The standards-staging issue tracker will be used to track defects to the standards, where a defect is considered a modification to align or clarify published decisions that does not materially change the standard.

* **Decision proposal branches:** `dp/<id>`<br/>
Change related to a decision proposal where <id> is the identifier of the decision proposal as published in the issue tracker in the standard repository (e.g. dp/114).

Once a release is scheduled the changes authored via the above branches will be merged into a release branch which, once reviewed for correctness, will be pushed to the main standards repository.  Release branches will also include direct changes such as modification of release notes, version numbers and links to archives of previous versions.  Release branches will take the following form.

* **Release candidate branches:** `release/<version>`</br>
The name of the each release branch where <version> is the semver version of the candidate release (e.g. release/1.6.0).
  
In addition, the following branch types will be used for specific purposes:

* **Experimental branches:** `poc/<name>`<br/>
Used for experiments or proof of concepts and allows for experimentation to be kept separate to the change management process. Experimental branches will never be directly merged and would need to become a change request or decision proposal branch.

* **Operational branches:** `operations/<name>`<br/>
Used to contain operational code such as publishing scripts and libraries.

## Rules of engagement for this repository

We're committed to undertaking conversations relating to the technical standards in the open. Questions or comments that participants might ask us via email or private message are likely to be questions or comments other participants have as well. Our answers will be of interest to everyone. There are likely to be experiences and lessons everybody working in this ecosystem can learn from. Having these conversations transparently helps us reduce duplication, resolve issues faster and keep everyone up to date with the conversation.

We ask that all contributors to the Consumer Data Standards repositories comply with the [GitHub Community Forum Code of Conduct](https://help.github.com/articles/github-community-forum-code-of-conduct/).

In addition, it would be appreciated if the following rules are adhered to when commenting or contributing:
* Please provide a single, considered response to each proposal covering all feedback concerning the proposal.
* For transparency, if you work at or are associated with an organisation with an interest in the standards, please indicate this in your response.
* Please ensure you are aware of and compliant with any social media guidelines or internal processes for response set by your organisation before providing feedback.
* Please refrain from initiating new issues or pull requests in this repository due to the need for formal approval of all aspects of the standards
