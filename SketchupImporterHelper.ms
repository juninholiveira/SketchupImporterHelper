--Cria um Array com a seleção atual
objetos = selection as array

--Loop FOR no array criado anteriorment
for obj in objetos do
(
	--Seleciona o objeto atual do loop
	select obj
	
	--Por segurança, converte ele em EditMesh antes, embora seja implícito que ele já seja um EditMesh
	convertTo $ TriMeshGeometry
	
	--Entra no modo sub-object EDGE
	subobjectLevel = 2
	
	--Seleciona tudo, ou seja, Ctrl-A, (Seleciona todas as edges)
	actionMan.executeAction 0 "40021"
	
	--Primeiro pega todas as edges e guarda num array (Não entendi direito o pq)
	--Depois usa o Auto-Edge
	edg=for i in $.edges collect i.index
	meshop.autoedge $ edg 89
	
	--Agora converte em EditPoly
	convertTo $ PolyMeshObject
	
	--Entra no modo sub-object VERTEX
	subobjectLevel = 1

	--Seleciona tudo, ou seja, Ctrl-A, (Seleciona todas os vértices)
	actionMan.executeAction 0 "40021"
	
	--Weld os vértices finalmente
	$.EditablePoly.weldFlaggedVertices ()

	--Sai do modo edição de SubObject e volta pro objeto
	subobjectLevel = 0
)