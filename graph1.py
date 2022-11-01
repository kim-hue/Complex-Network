import networkx as nx
import matplotlib.pyplot as plt
G  = nx.Graph()  # do thi vo huong, cho phep tu lap cac node hoac canh 
G.add_node(1) # them 1 node 
G.add_node(2)
#G.add_node([2, {"color": "red"}])
G.add_node(3)
G.add_node(4)
G.add_node(5)
#G.add_nodes_from([2, 3]) # them nhieu node 
#G.add_nodes_from([
#    (4, {"color": "red"}),
#    (5, {"color": "green"}), # them nhieu node voi mau 
#])
#elist = [(1,2),(3,5), (1,4), (2,5)]
#G.add_edges_from(elist)
G.add_edge(1,2, weight = 1)
G.add_edge(3,5, weight = 2)
G.add_edge(1,4, weight = 1)
G.add_edge(2,5, weight = 4)
nx.draw(G)
plt.show()