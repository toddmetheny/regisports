# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
OrderStatus.delete_all
OrderStatus.create! id: 1, name: "Processing"
OrderStatus.create! id: 2, name: "Completed"
OrderStatus.create! id: 3, name: "Cancelled"
OrderStatus.create! id: 4, name: "Refunded"

Event.delete_all
Event.create! id: 1, title: "5K Carnival", date: "2016-01-29", venue: "Centro de Convenciones de Ponce", address: "123 14th St", city: "Ponce",
	state: "PR",organizer: "Planet Entertainment",  website: "www.thesportsatelier.com",  description: "<p>** Atencion CAMBIO DE FECHA **<br />
Queremos anunciarle OFICIALMENTE cambio de fecha<br /> 5k CARNIVAL . Fun Run<br />La raz&oacute;n para el cambio es por motivos de RACIONAMIENTO de AGUA, 
tanto para muchos de los participantes. y por la Nueva LEY que no se puede utilizar agua para lavar aceras, calles y &aacute;reas de salidas y llegadas&nbsp;que
 afectan directamente la ruta de la carrera.&nbsp;La nueva fecha del Evento ser&aacute; el s&aacute;bado, 30 ENERO , a las 5:00pm en el Complejo Ferial de Ponce. 
 Las inscripciones para la carrera siguen abiertas. Si ya estas inscrito tu inscripci&oacute;n es v&aacute;lida para la nueva fecha. El recojido de paquete de participaci&oacute;n 
 sera en Sports Authority de Ponce el mismo d&iacute;a de la carrera de 10am a 3pm //&nbsp;Disculpen los inconvenientes.</p>", startTime: "5:00PM", endTime: "8:00PM", 
	image_file_name: "5k-Carnival-400x250sssstts.png", image_content_type: "image/png", image_file_size: 202280, image_updated_at: "2016-01-10 17:43:22",
	imagebig_file_name: "5kCarnival-Register-Image-1200'Event2sdsdsddsaaad.png", imagebig_content_type: "image/png", imagebig_file_size: 1204905,
	imagebig_updated_at: "2016-01-10 17:43:22",  longdescription: "Description" 


Option.delete_all
Option.create! id: 1, title: "Individual", category: "N/A",  saleEnd: "2016-01-29", price: 50.00,  fee: 2.95,  description: "<p><span style=font-size:20px><strong>Costos
de inscripci&oacute;n incluyen:</strong></span></p><ul><li>1 color (bolsita)</li><li>Camisteta Oficial</li><li>Medalla Oficial</li><li>N&uacute;mero de participante bib</li><li>20% de 
descuento en Sports Authority</li><li>Brazalete</li></ul>", promocode: "N/A",  event_id: 1