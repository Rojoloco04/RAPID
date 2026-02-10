# 2025-11-20T15:45:40.362411
import vitis

client = vitis.create_client()
client.set_workspace(path="RAPID")

client.delete_component(name="test")

platform = client.get_component(name="platform")
status = platform.build()

comp = client.get_component(name="hello_world")
comp.build()

status = platform.build()

comp.build()

status = platform.build()

comp.build()

vitis.dispose()

