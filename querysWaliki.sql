-- Mostrar el primer contrato

SELECT contrato
FROM contrato co
     JOIN tipo_contrato tc 	        ON 	co.id_tipo_contrato 	= 	tc.id_tipo_contrato
WHERE co.id_contrato = 1
GROUP BY
     co.id_contrato;


-- Proyectos vigentes

SELECT nombre_proyecto, monto_recaudar, fecha
FROM proyecto p
	JOIN imagen_proyecto ip 	ON 	p.id_proyecto 	= 	ip.id_proyecto
	JOIN imagen img 		ON 	ip.id_imagen 	= 	img.id_imagen
	JOIN estado e 			ON 	p.id_estado 	= 	e.id_estado
	JOIN fecha f			ON	f.fecha	= 	p.fecha_inicio
WHERE
	p.id_estado = 1
GROUP BY 
      p.nombre_proyecto, p.monto_recaudar, f.fecha;

-- Proyectos en proceso

SELECT src_imagen, nombre_proyecto, fecha_inicio, fecha_final
FROM proyecto p
	JOIN imagen_proyecto ip 	ON 	p.id_proyecto 	= 	ip.id_proyecto
	JOIN imagen img 		ON 	ip.id_imagen 	= 	img.id_imagen
	JOIN estado e 			ON 	p.id_estado 	= 	e.id_estado
	--JOIN fecha f			ON	f.fecha	= 	p.fecha_inicio
WHERE
	p.id_estado = 2
GROUP BY
    img.src_imagen, p.nombre_proyecto, p.fecha_inicio, p.fecha_final;

-- Listado donadores (pantalla 1)

SELECT nombre_persona, nombre_proyecto, monto
FROM donador d
     JOIN proyecto pr 	        ON 	d.id_donador 	= 	pr.id_proyecto
     JOIN donacion dn	        ON	d.id_donador	=	dn.id_donacion
     JOIN usuario us	        ON	us.id_usuario	=	d.id_usuario
     JOIN persona pe		ON	pe.id_persona	=	us.id_persona_fk
GROUP BY
     pe.nombre_persona , pr.nombre_proyecto, dn.monto;

-- Listado donadores (sobrepantalla)

SELECT nombre_proyecto, monto
FROM donador d
     JOIN proyecto pr 	        ON 	d.id_donador 	= 	pr.id_proyecto
     JOIN donacion dn	        ON	d.id_donador	=	dn.id_donacion
     JOIN usuario us	        ON	us.id_usuario	=	d.id_usuario
     JOIN persona pe		ON	pe.id_persona	=	us.id_persona_fk
WHERE pe.nombre_persona = 'Adelbert'
--AND pe.apellido_paterno = 'Lopez'
GROUP BY
     pe.nombre_persona , pr.nombre_proyecto, dn.monto;