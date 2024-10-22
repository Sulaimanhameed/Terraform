output "pub-SG" {
  value = module.sg.pub-SG
}
output "pvt-SG" {
  value = module.sg.pvt-SG
}

output "nat-vpc" {
  value = module.vpc.nat-vpc
}
output "pub-subnet" {
  value = module.vpc.pub-subnet
}
output "pvt-subnet" {
  value = module.vpc.pvt-subnet
}