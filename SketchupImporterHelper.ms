--Cria um Array com a sele��o atual
objetos = selection as array

--Loop FOR no array criado anteriorment
for obj in objetos do
(
	--Seleciona o objeto atual do loop
	select obj
	
	--Por seguran�a, converte ele em EditMesh antes, embora seja impl�cito que ele j� seja um EditMesh
	convertTo $ TriMeshGeometry
	
	--Entra no modo sub-object EDGE
	subobjectLevel = 2
	
	--Seleciona tudo, ou seja, Ctrl-A, (Seleciona todas as edges)
	actionMan.executeAction 0 "40021"
	
	--Primeiro pega todas as edges e guarda num array (N�o entendi direito o pq)
	--Depois usa o Auto-Edge
	edg=for i in $.edges collect i.index
	meshop.autoedge $ edg 89
	
	--Agora converte em EditPoly
	convertTo $ PolyMeshObject
	
	--Entra no modo sub-object VERTEX
	subobjectLevel = 1

	--Seleciona tudo, ou seja, Ctrl-A, (Seleciona todas os v�rtices)
	actionMan.executeAction 0 "40021"
	
	--Weld os v�rtices finalmente
	$.EditablePoly.weldFlaggedVertices ()

	--Sai do modo edi��o de SubObject e volta pro objeto
	subobjectLevel = 0
)