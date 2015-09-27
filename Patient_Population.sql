select 
distinct d.subject_id, d.hadm_id,  d.icustay_id, d.itemid, d.volume, d.volumeuom, d.rate, d.rateuom, c.icd9_code, a.discharge_location, i.intime

from 
mimiciii.ioevents d 
join  mimiciii.diagnoses_icd c on c.hadm_id=d.hadm_id
join mimiciii.admissions a on a.hadm_id=c.hadm_id
join mimiciii.icustayevents i on i.icustay_id=d.icustay_id

where
(c.icd9_code like '7855%' 
    OR c.icd9_code LIKE '038%'
    OR c.icd9_code LIKE '0200%'
    OR c.icd9_code LIKE '7907%'
    OR c.icd9_code LIKE '1179%'
    OR c.icd9_code LIKE '1125%'
    OR c.icd9_code LIKE '11281%')
    
AND d.itemid in (
--norepinephrine
221906,
--vasopressin
222315,
--epinephrine
221289,
--dopamine
221662,
--dobutamine
221653,
--Phenylephrine
221749
);
