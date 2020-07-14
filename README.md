# Understanding the Google Provider for Terraform (feat. K8s)

> Reading material and code examples

## Table of Contents

- [Understanding the Google Provider for Terraform (feat. K8s)](#understanding-the-google-provider-for-terraform-feat-k8s)
  - [Table of Contents](#table-of-contents)
  - [Important Links](#important-links)
  - [Reading material](#reading-material)
    - [Google Provider for Terraform](#google-provider-for-terraform)
    - [Code Quality](#code-quality)
    - [Google Cloud Platform Modules](#google-cloud-platform-modules)
  - [Author Information](#author-information)
  - [License](#license)

## Important Links

* Slides: [speakerdeck.com/ksatirli/understanding-the-google-provider-for-terraform-feat-k8s](https://speakerdeck.com/ksatirli/understanding-the-google-provider-for-terraform-feat-k8s)
* Code: [github.com/ksatirli/understanding-the-google-provider-for-terraform-feat-k8s](https://github.com/ksatirli/understanding-the-google-provider-for-terraform-feat-k8s)

## Reading material

This section is a collection of links that will help you make the most of today's session.

## Terraform Basics

* CLI commands [terraform.io/docs/commands/index.html](https://www.terraform.io/docs/commands/index.html)
* variables and type constraints: [terraform.io/docs/configuration/variables.html](https://www.terraform.io/docs/configuration/variables.html#type-constraints)
* variable definition files: [terraform.io/docs/configuration/variables.html](https://www.terraform.io/docs/configuration/variables.html#variable-definitions-tfvars-files)
* information about Terraform State: [terraform.io/docs/state/index.html](https://www.terraform.io/docs/state/index.html)

### Google Provider for Terraform

* ChangeLog on [GitHub](https://github.com/terraform-providers/terraform-provider-google/blob/master/CHANGELOG.md)
* documentation:
  * for the provider can be found on [terraform.io/docs/providers/google](https://www.terraform.io/docs/providers/google/index.html)

#### Google Cloud Platform Modules

We used the following modules:

* `network` by Google: [registry.terraform.io/modules/terraform-google-modules/network/google](https://registry.terraform.io/modules/terraform-google-modules/network/google/2.4.0)
* `kubernetes-engine` by Google: [registry.terraform.io/modules/terraform-google-modules/kubernetes-engine/google](https://registry.terraform.io/modules/terraform-google-modules/kubernetes-engine/google/10.0.0)

These modules are defined in [network.tf](https://github.com/ksatirli/understanding-the-google-provider-for-terraform-feat-k8s/blob/master/network.tf) and [cluster.tf](https://github.com/ksatirli/understanding-the-google-provider-for-terraform-feat-k8s/blob/master/cluster.tf)

### Code Quality

Before `plan` and `apply`, always clean up your code:

* use [terraform fmt](https://www.terraform.io/docs/commands/fmt.html) to rewrite Terraform configuration files to a canonical format and style.
* use [terraform validate](https://www.terraform.io/docs/commands/validate.html) to validate the configuration syntax and internal consistency

## Author Information

This repository is maintained by [Kerim Satirli](https://github.com/ksatirli) and [Taylor Dolezal](https://github.com/onlydole).

## License

Licensed under the Apache License, Version 2.0 (the "License").

You may obtain a copy of the License at [apache.org/licenses/LICENSE-2.0](http://www.apache.org/licenses/LICENSE-2.0).

Unless required by applicable law or agreed to in writing, software distributed under the License is distributed on an _"AS IS"_ basis, without WARRANTIES or conditions of any kind, either express or implied.

See the License for the specific language governing permissions and limitations under the License.
