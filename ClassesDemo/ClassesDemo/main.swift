
let skaleton = Enemy(health: 100, attackStrenght: 10)

let skaleton2 = skaleton

skaleton.takeDamage(amount: 10)
skaleton.takeDamage(amount: 10)
skaleton2.takeDamage(amount: 10)




print(skaleton.health)
print(skaleton2.health)
