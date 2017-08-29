defmodule Univerex.Schedule do
  defstruct [:id, :subject, :instructorid,
             :firstname, :middlename, :lastname,
             :begintime, :endtime, :eventtype,
             :groupid, :groupname, :groupnumber,
             :subgroupnumber, :studyform, :coursenumber,
             :building, :room, :pairnumber, :termnumber,
             :termpart, :weekday, :weeknumber] 
end