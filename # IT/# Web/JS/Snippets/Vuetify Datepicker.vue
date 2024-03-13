<v-menu v-model="menu" :close-on-content-click="false" transition="scale-transition" offset-y max-width="290px" min-width="290px">
  <template v-slot:activator="{ on }">
    <v-text-field v-model="localDate" :label="$t('validAtPickerResx.label')" :hint="$t('validAtPickerResx.hint', { format: format })"
      persistent-hint prepend-icon="event" @change="onLocalDateChanged" @blur="resetLocalDate" v-on="on">
    </v-text-field>
  </template>
  <v-date-picker v-model="isoDate" no-title @input="menu = false">
  </v-date-picker>
</v-menu>