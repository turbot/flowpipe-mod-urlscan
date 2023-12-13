# URLScan.io Mod for Flowpipe

URLScan.io pipeline library for [Flowpipe](https://flowpipe.io), enabling seamless integration of URLScan.io services into your workflows.

## Documentation

- **[Pipelines →](https://hub.flowpipe.io/mods/turbot/urlscan/pipelines)**

## Getting Started

### Requirements

Docker daemon must be installed and running. Please see [Install Docker Engine](https://docs.docker.com/engine/install/) for more information.

### Installation

Download and install Flowpipe (https://flowpipe.io/downloads). Or use Brew:

```sh
brew tap turbot/tap
brew install flowpipe
```

Clone:

```sh
git clone https://github.com/turbot/flowpipe-mod-urlscanio.git
cd flowpipe-mod-urlscanio
```

### Credentials

By default, the following environment variables will be used for authentication:

- `URLSCAN_API_KEY`

You can also create `credential` resources in configuration files:

```sh
vi ~/.flowpipe/config/urlscan.fpc
```

```hcl
credential "urlscan" "my_urlscan" {
  api_key = "AKIA...2"
}
```

For more information on credentials in Flowpipe, please see [Managing Credentials](https://flowpipe.io/docs/run/credentials).

### Usage

List pipelines:

```sh
flowpipe pipeline list
```

Run a pipeline:

```sh
flowpipe pipeline run get_user_quota
```

You can pass in pipeline arguments as well:

```sh
flowpipe pipeline run submit_url_scan --arg url="steampipe.io"
```

To use a specific `credential`, specify the `cred` pipeline argument:

```sh
flowpipe pipeline run get_user_quota --arg cred=my_urlscan
```

For more examples on how you can run pipelines, please see [Run Pipelines](https://flowpipe.io/docs/run/pipelines).

### Configuration

No additional configuration is required.

## Open Source & Contributing

This repository is published under the [Apache 2.0 license](https://www.apache.org/licenses/LICENSE-2.0). Please see our [code of conduct](https://github.com/turbot/.github/blob/main/CODE_OF_CONDUCT.md). We look forward to collaborating with you!

[Flowpipe](https://flowpipe.io) is a product produced from this open source software, exclusively by [Turbot HQ, Inc](https://turbot.com). It is distributed under our commercial terms. Others are allowed to make their own distribution of the software, but cannot use any of the Turbot trademarks, cloud services, etc. You can learn more in our [Open Source FAQ](https://turbot.com/open-source).

## Get Involved

**[Join #flowpipe on Slack →](https://flowpipe.io/community/join)**

Want to help but not sure where to start? Pick up one of the `help wanted` issues:

- [Flowpipe](https://github.com/turbot/flowpipe/labels/help%20wanted)
- [URLScan.io Mod](https://github.com/turbot/flowpipe-mod-urlscanio/labels/help%20wanted)
