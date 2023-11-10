#---------------------
# Create policies
#---------------------

# Render template exemplo policy
data "template_file" "template_exemplo_policy" {  
  template = templatefile("${path.module}/templates/exemplo.hcl.tftpl", {app = var.apps_spring_boot , envs = var.apps_name_environments})
}

#Create exemplo policy
resource "vault_policy" "exemplo_policy" {
  depends_on  = [data.template_file.template_exemplo_policy]
  name        = "exemplo"
  policy      =  data.template_file.template_exemplo_policy.rendered
}
