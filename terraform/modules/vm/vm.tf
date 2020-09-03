resource "azurerm_network_interface" "test" {
  name                = "${var.prefix}-netinterface"
  location            = "${var.location}"
  resource_group_name = "${var.resource_group}"

  ip_configuration {
    name                          = "internal"
    subnet_id                     = "${var.subnet_id}"
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          =  "${var.public_ip}"

  }
}

resource "azurerm_linux_virtual_machine" "test" {
  name                = "${var.prefix}-vm"
  location            = "${var.location}"
  resource_group_name = "${var.resource_group}"
  size                = "Standard_B1s"
  admin_username      = "ivan-clare_ngong"
  network_interface_ids = ["${azurerm_network_interface.test.id}"]
  admin_ssh_key {
    username   = "ivan-clare_ngong"
    public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQC1ZlZXeeJiJL/Q0WEVQtfAy+v0V7NTlgScZR2eGJtLRvea7fKpdCx8zaUP4EP57quWxNrndfouhFLhZgFNihT0ByZalwGwyLMXhk5hGSuporLR20tN2cdzc1Ku7uv+1P1D6ptIijgQ7fJpKBtkgUHFun7dmg25Z4THEuLWHheAyaES8ggi+b+WniVtKShyxcQKpg1pVmO2RXo+WgCvE3IzFzF5CPCLefIZwxjfP31xAk3rWI62KGL1kSu8BQgO5md3MiM7qfVD63nsqv3d5R3S1ex85xY91bU4M/XptgGLCi2teOBke4L0Vk2NKPjGHtaSg09I9fDgu3jgxSAwh8fEq0mFu7Ft0Ia6MD4HS0rO3YBwpcTcgl2d+pU+3pWPOrEMkn70bFWKElcHrVFWt0xPdOdC/PB431McXJz+HdWHAGhAefe+TURdAjK8sl0AHQU6V3smOp6h2xvqw7UQjiqhs68yX4HNa3WMCCl616FpP41ngbmiUayetdgTODH/eUcoVVqbNQTihglxaHmXguk8NcK6XmfKH0vYw7UGv6SxeCAajQQdL3F2scN7gd8yWjfXO1XTw6ZzR5SHtEc6TOxf8p5vi2HVVh2R3u/QilfqPZhvAcM9Z4Hg+ptZRRLl2UcqXaYS1fSxvEvxS5iDtLTTvqXOIKgd0dv77V8STxICCQ== ivan-clare_ngong@cc-f364f694-7fcd46ddc9-9hdnd"
  }
  os_disk {
    caching           = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }
  source_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "18.04-LTS"
    version   = "latest"
  }
}
