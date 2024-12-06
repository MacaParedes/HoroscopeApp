function enableEditing(id) {
    // Enable the input fields for the selected row
    document.querySelectorAll(`#row-${id} input`).forEach(input => {
        input.disabled = false;
    });

    // Show the Save and Cancel buttons, hide the Edit button
    document.querySelector(`#row-${id} .btn-primary`).style.display = 'none'; // Edit
    document.querySelector(`#row-${id} .btn-success`).style.display = 'inline-block'; // Save
    document.querySelector(`#row-${id} .btn-secondary`).style.display = 'inline-block'; // Cancel
}

function saveUser(id) {
    // Get the updated values from the input fields
    const nombre = document.querySelector(`input[name="nombre-${id}"]`).value;
    const username = document.querySelector(`input[name="username-${id}"]`).value;
    const email = document.querySelector(`input[name="email-${id}"]`).value;

    console.log("NOMBRE " + nombre);
    console.log("USER NAME " + username  );
    console.log("EMAIL " + email);
    console.log(`Payload: id=${id}&nombre=${encodeURIComponent(nombre)}&username=${encodeURIComponent(username)}&email=${encodeURIComponent(email)}`);

    // Make an AJAX POST request to update the user
    fetch('modifyUser', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/x-www-form-urlencoded',
        },

        body: `id=${id}&nombre=${encodeURIComponent(nombre)}&username=${encodeURIComponent(username)}&email=${encodeURIComponent(email)}`
    })
        .then(response => {
            if (response.ok) {
                alert('User updated successfully!');
                cancelEditing(id);
                location.reload();
            } else {
                alert('Failed to update user.');
            }
        })
        .catch(error => {
            console.error('Error updating user:', error);
            alert('Failed to update user.');
        });
}

function cancelEditing(id) {
    // Reset the input fields to their original values
    const row = document.querySelector(`#row-${id}`);
    const nombre = row.querySelector(`input[name="nombre-${id}"]`);
    const username = row.querySelector(`input[name="username-${id}"]`);
    const email = row.querySelector(`input[name="email-${id}"]`);

    nombre.value = nombre.defaultValue;
    username.value = username.defaultValue;
    email.value = email.defaultValue;

    // Disable the input fields
    document.querySelectorAll(`#row-${id} input`).forEach(input => {
        input.disabled = true;
    });

    // Show the Edit button, hide the Save and Cancel buttons
    document.querySelector(`#row-${id} .btn-primary`).style.display = 'inline-block'; // Edit
    document.querySelector(`#row-${id} .btn-success`).style.display = 'none'; // Save
    document.querySelector(`#row-${id} .btn-secondary`).style.display = 'none'; // Cancel
}
