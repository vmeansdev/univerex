# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
use Mix.Config

config :univerex,
    base_url: "https://univeris.susu.ru/services/mobile/Get",
    faculties: "Faculties",
    groups: "Groups/FacultyId/",
    term: "CurrentTerm/GroupId/",
    schedule: "StudySchedule/GroupId/"