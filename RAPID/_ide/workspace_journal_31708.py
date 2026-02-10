# 2025-12-01T14:32:42.826461800
import vitis

client = vitis.create_client()
client.set_workspace(path="RAPID")

platform = client.create_platform_component(name = "motorDriver",platform_xpfm_path = "$COMPONENT_LOCATION/../platform/export/platform/platform.xpfm",generate_dtb = False)

client.delete_component(name="platform")

client.delete_component(name="platform")

client.delete_component(name="hello_world")

comp = client.create_app_component(name="motorDriver_SW",platform = "$COMPONENT_LOCATION/../motorDriver/export/motorDriver/motorDriver.xpfm",domain = "standalone_ps7_cortexa9_0",template = "hello_world")

vitis.dispose()

