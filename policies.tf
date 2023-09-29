#---------------------
# Create policies
#---------------------


# Render template dev policy
data "template_file" "template_dev_policy" {  
  template = templatefile("${path.module}/templates/dev-policy.hcl.tftpl", {apps = local.all_apps , env = var.apps_name_environments[0]})
}

#Create development policy in the dev apps
resource "vault_policy" "dev_policy" {
  depends_on  = [data.template_file.template_dev_policy]
  name        = "developers"
  policy      =  data.template_file.template_dev_policy.rendered
}

# Render template sys policy
data "template_file" "template_sus_policy" {  
  template = templatefile("${path.module}/templates/sus-policy.hcl.tftpl", {apps = local.all_apps , env = var.apps_name_environments[3]})
}

#Create sus policy in the apps
resource "vault_policy" "sus_policy" {
  depends_on  = [data.template_file.template_sus_policy]
  name        = "SUS"
  policy      =  data.template_file.template_sus_policy.rendered
}