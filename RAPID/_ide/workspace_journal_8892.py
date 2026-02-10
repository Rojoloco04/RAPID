# 2025-12-02T12:14:50.512454600
import vitis

client = vitis.create_client()
client.set_workspace(path="RAPID")

platform = client.get_component(name="motorDriver")
status = platform.build()

vitis.dispose()

