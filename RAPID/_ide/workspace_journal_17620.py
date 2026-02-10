# 2025-11-20T15:41:16.657466400
import vitis

client = vitis.create_client()
client.set_workspace(path="RAPID")

comp = client.create_app_component(name="test",platform = "$COMPONENT_LOCATION/../platform/export/platform/platform.xpfm",domain = "standalone_ps7_cortexa9_0",template = "hello_world")

vitis.dispose()

