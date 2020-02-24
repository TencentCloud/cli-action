# cli-action
GitHub Action for Tencent Cloud API 3.0 Command Line Interface

## Inputs

### `secret_id`

**Required** Tencent Cloud secret id. Should be referred to a encrypted environment variable.

### `secret_key`

**Required** Tencent Cloud secret key. Should be referred to a encrypted environment variable.

### `region`

**Required** Tencent Cloud product region.

### `commands`

**Required** Tencent Cloud CLI commands. Mult commands seperate by `&&`.

### `output_format`

**Optional** Data format of command output. Available values are `json`, `table`, `text`. Default is `json`.

## Example usage

```
uses: TencentCloud/cli-action@master
with:
  secret_id: ${{ secrets.TENCENT_CLOUD_SECRET_ID }}
  secret_key: ${{ secrets.TENCENT_CLOUD_SECRET_KEY }}
  region: ${{ secrets.TENCENT_PRODUCT_REGION }}
  commands: help && version
  output_format: json
```
