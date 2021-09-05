terraform {
 backend "remote" {
   hostname      = "app.terraform.io"
   organization  = "jerryli-ctc"

   workspaces {
     name = "sa-child-module-example"
   }
 }
}