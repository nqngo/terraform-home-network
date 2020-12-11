# Unifi Home Network

My [Terraform](terraform.io)-managed Unifi home network as Infrastructure as Code. Feel free to clone this repo to use as base for your project.

Please note that not all GUI functionality has been implemented yet. If you found any errors, feel free to create an issue.

## Usage Notes

1. Set up your environment variable in an `.env` file. See `example.env` for example.
2. [Terraform Cloud](app.terraform.io) is used as the backend to store the `tfstate`. Please use `terraform login` and configure your backend to your own workspace.
3. Each site is managed as a module from `main.tf`. Rename `site-modules` to your relevant site name. While it's possible to create `site` resource and manage it from `default`. It is easier to manage to hard-code the site ID directly from `main.tf`.
4. Put all clients in the relevant `site-*/data/$network.csv`. See `clients.tf`.
5. If you have existing resources, import the resource in to manage it in Terraform. For example:
```bash
env $(cat example.env | xargs) terraform import module.site-neale.unifi_user_group.d80u20 5f10563e8f7939532b7984c1
```
6. The resource `id` can be usually parsed from the browser. For example:
```
https://unifi.example.com:8443/manage/site/abcdefgh/settings/usergroups/edit/5f10563e8f7939532b7984c1
```
7. This codebase is written for cloud controller `5.x`. Some attributes are deprecated in cloud controller `6.x`, ignore any deprecation warning if you are running `5.x` controller.
8. Run `terraform init` each time you add a module.
