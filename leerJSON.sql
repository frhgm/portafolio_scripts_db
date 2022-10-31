DECLARE
    l_object    json_object_t;
    l_array     JSON_ARRAY_T;
    disc_v      number;
    objeto_json varchar2(11000);
BEGIN
    objeto_json := '{
    "solicitud": {
        "id": 26,
        "usuario_id": "18392764-7",
        "fecha": "2022-10-18",
        "direccion": "su casita 123",
        "estado_solicitud_pedido_id": 1,
        "detalle_productos": [
            {
                "producto_id": 1,
                "calidad": 5,
                "cantidad": 10
            },
            {
                "producto_id": 10,
                "calidad": 5,
                "cantidad": 5
            }
        ]
    }
}';
    l_object := json_object_t.parse(objeto_json);

    l_array := l_object.get_object('solicitud').get_array('detalle_productos');
    for i in 0 .. l_array.get_size - 1
        loop
            disc_v :=
                    treat(l_array.get(i) as json_object_t).get_string('producto_id');
            dbms_output.put_line(disc_v);
        end loop;
END;
