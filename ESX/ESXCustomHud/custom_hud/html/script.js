window.addEventListener('message', function(event) {
    if (event.data.action === 'updateHUD') {
        updateHealth(event.data.health);
        updateArmor(event.data.armor);
        updateExtraArmor(event.data.armorCount);
        updateHunger(event.data.hunger);
        updateThirst(event.data.thirst);
        updateStamina(event.data.stamina);
        updatePlayerInfo(event.data.playerId, event.data.cash, event.data.bank, event.data.serverAbbreviation);
    }
});


// Add this new function
function updatePlayerInfo(id, cash, bank, serverAbbreviation) {
    document.getElementById('server-abbreviation').textContent = serverAbbreviation;
    document.getElementById('player-id').textContent = id;
    document.getElementById('player-cash').textContent = '$' + cash.toLocaleString();
    document.getElementById('player-bank').textContent = '$' + bank.toLocaleString();
    document.getElementById('player-black-money').textContent = '$' + event.data.blackMoney.toLocaleString();
}


// Color cycling for server abbreviation
const colors = ['#ff0000', '#ff7f00', '#ffff00', '#00ff00', '#0000ff', '#8b00ff'];
let colorIndex = 0;

function cycleColor() {
    const abbreviation = document.getElementById('server-abbreviation');
    abbreviation.style.color = colors[colorIndex];
    colorIndex = (colorIndex + 1) % colors.length;
}

setInterval(cycleColor, 500); // Change color every second



function updateHealth(health) {
    document.getElementById('health-value').textContent = Math.max(0, Math.min(100, Math.floor(health)));
}

function updateArmor(armor) {
    document.getElementById('armor-value').textContent = Math.min(Math.floor(armor), 100);
}

function updateExtraArmor(count) {
    const extraArmorIcon = document.getElementById('extra-armor-icon');
    if (count >= 2) {
        extraArmorIcon.classList.remove('hidden');
    } else {
        extraArmorIcon.classList.add('hidden');
    }
}

function updateHunger(hunger) {
    document.getElementById('hunger-value').textContent = Math.max(0, Math.min(100, Math.floor(hunger)));
    updateIconColor('hunger-icon', hunger);
}

function updateThirst(thirst) {
    document.getElementById('thirst-value').textContent = Math.max(0, Math.min(100, Math.floor(thirst)));
    updateIconColor('thirst-icon', thirst);
}

function updateStamina(stamina) {
    document.getElementById('stamina-value').textContent = Math.max(0, Math.min(100, Math.floor(stamina)));
    updateIconColor('stamina-icon', stamina);
}

function updateIconColor(iconId, value) {
    const icon = document.getElementById(iconId);
    if (value > 75) {
        icon.style.color = '#00ff00'; // Green
    } else if (value > 50) {
        icon.style.color = '#ffff00'; // Yellow
    } else if (value > 25) {
        icon.style.color = '#ffa500'; // Orange
    } else {
        icon.style.color = '#ff0000'; // Red
    }
}