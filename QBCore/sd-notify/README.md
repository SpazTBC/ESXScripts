Client-side usage:

-- Using exports
exports['sd-notify']:NotifySuccess('Operation completed successfully!', 'Success')
exports['sd-notify']:NotifyWarning('You are running low on fuel.', 'Vehicle Warning')
exports['sd-notify']:NotifyInfo('The store will close in 5 minutes.', 'Store Info')
exports['sd-notify']:NotifyError('Failed to connect to the server.', 'Connection Error')

-- Using events
TriggerEvent('sd-notify:client:NotifySuccess', 'Operation completed successfully!', 'Success')
TriggerEvent('sd-notify:client:NotifyWarning', 'You are running low on fuel.', 'Vehicle Warning')
TriggerEvent('sd-notify:client:NotifyInfo', 'The store will close in 5 minutes.', 'Store Info')
TriggerEvent('sd-notify:client:NotifyError', 'Failed to connect to the server.', 'Connection Error')

Server-side usage:

-- Using exports
exports['sd-notify']:NotifyPlayerSuccess(source, 'You won the lottery!', 'Congratulations')
exports['sd-notify']:NotifyPlayerWarning(source, 'Your vehicle is about to explode!', 'Danger')
exports['sd-notify']:NotifyPlayerInfo(source, 'A new event is starting soon.', 'Event Info')
exports['sd-notify']:NotifyPlayerError(source, 'Transaction failed.', 'Bank Error')

-- Using events
TriggerEvent('sd-notify:server:NotifyPlayerSuccess', source, 'You won the lottery!', 'Congratulations')
TriggerEvent('sd-notify:server:NotifyPlayerWarning', source, 'Your vehicle is about to explode!', 'Danger')
TriggerEvent('sd-notify:server:NotifyPlayerInfo', source, 'A new event is starting soon.', 'Event Info')
TriggerEvent('sd-notify:server:NotifyPlayerError', source, 'Transaction failed.', 'Bank Error')