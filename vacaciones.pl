% destino(Persona,Lugar).

destino(dodain, sanMartin).
destino(dodain, pehuenia).
destino(dodain, esquel).
destino(dodain, sarmiento).
destino(dodain, camarones).
destino(dodain, playasDoradas).

destino(alf, bariloche).
destino(alf, sanMartin).
destino(alf, elBolson).

destino(nico, marDelPlata).

destino(vale, calafate).
destino(vale, elBolson). 

destino(martu, marDelPlata).
destino(martu, bariloche).
destino(martu, sanMartin).
destino(martu, elBolson).

% Punto 2

atracciones(esquel, parqueNacional(losAlerces)).
atracciones(esquel, excursion(trochita)).
atracciones(esquel, excursion(trevelin)).

atracciones(pehuenia, cerro(mahuida, 2000)).
atracciones(pehuenia, agua(moquehue, puedePescar, 14)).
atracciones(pehuenia, agua(alumine, puedePescar, 19)).

vacacionesCopadas(Persona) :-
    destino(Persona,_),
    forall(destino(Persona,Destino), tieneAtraccionCopada(Destino)).

tieneAtraccionCopada(Destino) :-
    atracciones(Destino, Atraccion),
    altaAtraccion(Atraccion).

altaAtraccion(cerro(_,Metros)) :-
    Metros > 2000.

altaAtraccion(agua(_,puedePescar,_)).
altaAtraccion(agua(_,_,Temperatura)) :-
    Temperatura > 20.

altaAtraccion(playa(DiferenciaMareas)) :-
    DiferenciaMareas < 5.

altaAtraccion(excursion(Nombre)) :-
    atom_length(Nombre, Letras),
    Letras > 7.

altaAtraccion(parqueNacional(_)).


% Punto 3
noSeCruzaron(Persona, OtraPersona) :-
    destino(Persona, _),
    destino(OtraPersona, _),
    not(seCruzaron(Persona, OtraPersona)).
    
seCruzaron(Persona, OtraPersona) :-
    destino(Persona, Destino),
    destino(OtraPersona, Destino).


% Punto 4

costoDeVida(sarmiento, 100).
costoDeVida(esquel, 150).
costoDeVida(pehuenia,180).
costoDeVida(sanMartin, 150).
costoDeVida(camarones, 135).
costoDeVida(playasDoradas, 170).
costoDeVida(bariloche, 140).
costoDeVida(calafate, 240).
costoDeVida(elBolson, 145).
costoDeVida(marDelPlata, 140).

vacacionesGasoleras(Persona) :-
    destino(Persona,_),
    forall(destino(Persona,Destino), destinoGasolero(Destino)).

destinoGasolero(Destino) :-
    costoDeVida(Destino, Costo),
    Costo < 160. 
