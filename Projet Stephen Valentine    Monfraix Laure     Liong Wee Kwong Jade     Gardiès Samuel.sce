// Stephen Valentine    Monfraix Laure     Liong-Wee-Kwong Jade     Gardiès Samuel

// Projet N°3 Racines des Polynomes

// 1)
// méthode pour approcher les valeurs des racines d'un polynome:
// étape 1: tracer le polynome pour estimer graphiquement les valeurs des ses racines grâce à 
// leurs tangentes
// étape 2: calculer la dérivée du polynome 
// étape 3: grâce aux résultats obtenus, utiliser le programme suivant pour obtenir les valeurs
// des racines ainsi que la vitesse de convergence (x0 correspond aux estimations obtenues à 
// l'étape 1):
function y=f(x)
    y=48-(76*x)+(20*x^2)+(15*x^3)-(8*x^4)+x^5   // remplacer par le polynome voulu
endfunction

function y=df(x)
    y=-76+(40*x)+(45*x^2)-(32*x^3)+(5*x^4)      // remplacer par la dérivée du polynome voulu
endfunction

function [y1,y2]=phi(x0)
    a=x0-(f(x0)/df(x0))
    compteur=0
    b=0
    while b==0
            ancienA=a
            a=a-(f(a)/df(a))
            if abs(a-ancienA)<10^-13 then
                b=1
            end
            compteur=compteur+1     // plus la valeur du compteur est faible, plus la méthode converge vite
    end
    y1=a
    y2=compteur
endfunction

// 2) 
function y=f(x)
    y=36-(69*x)+(43*x^2)-(11*x^3)+x^4
endfunction

function y=df(x)
    y=-69+(86*x)-(33*x^2)+(4*x^3)
endfunction
// la méthode de Newton converge pour une racine multiple mais on remarque qu'elle converge bien moins rapidement que 
// pour une simple

// 3)
// on suit les mêmes étapes que pour la méthode de Newton mais en utilisant le programme suivant:
function [y1,y2]=phiPas(x0)
    a=x0-(2*(f(x0)/df(x0)))
    compteur=0
    b=0
    while b==0
            ancienA=a
            a=a-(2*(f(a)/df(a)))
            if abs(a-ancienA)<10^-13 then
                b=1
            end
            compteur=compteur+1
    end
    y1=a
    y2=compteur
endfunction
// on remarque que pour une racine double, la méthode de doublement de pas converge plus vite que la méthode de Newton

// 4)
// la méthode de doublement de pas converge plus vite que la méthode de newton car 
// 2*(f(a)/df(a)) croit plus vite que f(a)/df(a) 

// 5) méthode pour détecter les racines doubles:
// suivre les étapes 1 et 2 du 1) puis appliquer le programme suivant:
function y=RacineDouble?(x0)
    y="Non"
    [x,VitesseNewton]=phi(x0)
    [z,VitessePas]=phiPas(x0)
    if VitessePas<VitesseNewton then    
        y="Oui"
    end
// si la méthode de doublement de pas converge plus vite que la méthode de newton, alors la racine que l'on approche est une racine double
endfunction
