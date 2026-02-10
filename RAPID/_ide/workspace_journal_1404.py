# 2025-12-01T14:39:49.775101300
import vitis

client = vitis.create_client()
client.set_workspace(path="RAPID")

platform = client.get_component(name="motorDriver")
status = platform.build()

comp = client.get_component(name="motorDriver_SW")
comp.build()

vitis.dispose()

