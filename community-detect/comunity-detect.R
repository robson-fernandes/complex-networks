# Biblioteca igraph
library(igraph)

# Geração de 2 redes (Barabasi) e (Watts Strogatz) 
G1 <- barabasi.game(n=100, power=2, directed=F)
G2 <- watts.strogatz.game(dim=1, size=100, nei=5, p=0.05)

# Unificação em um único grafo
G  <- graph.union(G1,G2)

# Simplificar a rede (grafo), 
# de forma que ele não contenha loops e arestas múltiplas.
g <- simplify(G)

# Visualizar rede (grafo)
plot(g, 
     vertex.label=NA, 
     vertex.size=10, 
     layout=layout.fruchterman.reingold)


#Avaliação Modularidade
wc <- edge.betweenness.community(g)
modularity(wc)
#0.5001495

wc <- fastgreedy.community(g)
modularity(wc)
#0.4505672

wc <- walktrap.community(g)
modularity(wc)
#0.5038642

# Visualizar comunidades da rede (grafo) 
# Algoritmo walktrap.community
plot(g, vertex.label=NA, vertex.size=10, 
     vertex.color=membership(wc),
     layout=layout.fruchterman.reingold)

