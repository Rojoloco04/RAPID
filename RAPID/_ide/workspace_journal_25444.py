# 2025-12-01T14:38:07.317731800
import vitis

client = vitis.create_client()
client.set_workspace(path="RAPID")

platform = client.get_component(name="motorDriver")
status = platform.build()

status = platform.build()

vitis.dispose()

