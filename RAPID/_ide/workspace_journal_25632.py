# 2026-02-05T15:14:13.523756900
import vitis

client = vitis.create_client()
client.set_workspace(path="RAPID")

platform = client.get_component(name="motorDriver")
status = platform.build()

vitis.dispose()

vitis.dispose()

