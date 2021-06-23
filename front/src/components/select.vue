<template>
<v-select

  label='Names'
  
  :items='names'
  item-value='id'
  item-text='name'
  return-object
>
  <template slot='selection' slot-scope='{ item }'>
    {{ item.name }} - {{ item.age }}
  </template>
  <template slot='item' slot-scope='{ item }'>
    {{ item.name }} - {{ item.age }}
  </template>
</v-select>
</template>

<script> 
export default {
  data: () => ({
    names:[
      {id: 1, name: 'Paul', age: 23},
      {id: 2, name: 'Marcelo', age: 15},
      {id: 3, name: 'Any', age: 30},
    ]
  })
}   
</script>