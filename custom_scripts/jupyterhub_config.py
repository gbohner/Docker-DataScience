# Ensure that each user has access to all folders within the container 
c.Spawner.notebook_dir = '/'
c.Spawner.environment = {'NB_UMASK': '0o022', 'JULIA_DEPOT_PATH': '/opt/julia', 'JULIA_LOAD_PATH': '/opt/julia'}
