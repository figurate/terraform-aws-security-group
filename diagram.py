from diagrams import Diagram, Cluster
from diagrams.custom import Custom
from diagrams.onprem.network import Internet

with Diagram("AWS Security Group", show=False, direction="TB"):

    internet = Internet("internet")

    with Cluster("vpc"):

        internet >> [
            Custom("HTTPS", "web-browser.png"),
            Custom("SSH", "lock.png")
        ]
